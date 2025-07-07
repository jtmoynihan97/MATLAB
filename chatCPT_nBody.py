import pygame
import math
import random

G = 6.67430e-11  # gravitational constant

class Body:
    def __init__(self, mass, x, y, vx, vy):
        self.mass = mass
        self.x = x
        self.y = y
        self.vx = vx
        self.vy = vy

def calculate_force(body1, body2):
    dx = body2.x - body1.x
    dy = body2.y - body1.y
    dist = math.sqrt(dx*dx + dy*dy)
    force = G * body1.mass * body2.mass / (dist*dist)
    fx = force * dx / dist
    fy = force * dy / dist
    return fx, fy

def update_bodies(bodies, dt):
    for body in bodies:
        fx, fy = 0, 0
        for other in bodies:
            if other != body:
                fx_, fy_ = calculate_force(body, other)
                fx += fx_
                fy += fy_
        ax = fx / body.mass
        ay = fy / body.mass
        body.vx += ax * dt
        body.vy += ay * dt
        body.x += body.vx * dt
        body.y += body.vy * dt

def calculate_center_of_mass(bodies):
    total_mass = 0
    center_x, center_y = 0, 0
    for body in bodies:
        total_mass += body.mass
        center_x += body.mass * body.x
        center_y += body.mass * body.y
    return center_x / total_mass, center_y / total_mass

def main():
    # Set up Pygame
    pygame.init()
    win_width = 640
    win_height = 480
    window = pygame.display.set_mode((win_width, win_height))
    clock = pygame.time.Clock()
    font = pygame.font.SysFont('Arial', 14)
    
    # User-defined parameters
    num_bodies = int(input("Enter number of bodies: "))
    max_mass = 1e+20
    max_velocity = 1e+4
    min_distance = 50
    
    # Initialize bodies
    bodies = []
    for i in range(num_bodies):
        mass = random.uniform(1, max_mass)
        x = random.uniform(0, win_width)
        y = random.uniform(0, win_height)
        while any(math.sqrt((x-b.x)**2 + (y-b.y)**2) < min_distance for b in bodies):
            x = random.uniform(0, win_width)
            y = random.uniform(0, win_height)
        vx = random.uniform(-max_velocity, max_velocity)
        vy = random.uniform(-max_velocity, max_velocity)
        bodies.append(Body(mass, x, y, vx, vy))
    
    # Main simulation loop
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                return
        
        # Update bodies
        dt = 0.1
        update_bodies(bodies, dt)
        
        # Calculate center of mass
        center_x, center_y = calculate_center_of_mass(bodies)
        
        # Draw bodies and center of mass
        window.fill((0, 0, 0))
        for body in bodies:
            pygame.draw.circle(window, (255, 255, 255), (int(body.x), int(body.y)), 2)
        pygame.draw.line(window, (255, 0, 0))
