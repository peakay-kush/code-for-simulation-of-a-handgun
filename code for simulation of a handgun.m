% Constants
g = 9.81; % Acceleration due to gravity (m/s^2)
v0 = 300; % Initial velocity of the bullet (m/s)
mass_bullet = 0.01; % Mass of the bullet (kg)

% Create an array of launch angles from 0 to 90 degrees
angles = 0:1:90; % Range of angles in degrees

% Initialize arrays to store results
max_heights = zeros(size(angles)); % Max heights reached
times_to_ground = zeros(size(angles)); % Time to return to the ground

% Simulation for different launch angles
for i = 1:length(angles)
    angle_deg = angles(i); % Current launch angle in degrees
    
    % Convert the launch angle to radians
    angle_rad = deg2rad(angle_deg);
    
    % Calculate initial vertical velocity
    vy0 = v0 * sin(angle_rad);
    
    % Calculate time of flight
    t_flight = (2 * vy0) / g;
    
    % Calculate maximum height
    h_max = (vy0^2) / (2 * g);
    
    % Calculate time to return to the ground
    t_ground = sqrt(2 * h_max / g);
    
    % Store results
    max_heights(i) = h_max;
    times_to_ground(i) = t_ground;
    
    % Check if the bullet's height at the end of the simulation is below a certain safe threshold (e.g., 2 meters)
    if h_max < 2
        fprintf('Angle: %.1f degrees - SAFE\n', angle_deg);
    else
        fprintf('Angle: %.1f degrees - POTENTIALLY DANGEROUS\n', angle_deg);
    end
end

% Plot the results
figure;
subplot(2, 1, 1);
plot(angles, max_heights);
xlabel('Launch Angle (degrees)');
ylabel('Maximum Height (m)');
title('Maximum Height vs. Launch Angle');

subplot(2, 1, 2);
plot(angles, times_to_ground);
xlabel('Launch Angle (degrees)');
ylabel('Time to Ground (s)');
title('Time to Return to the Ground vs. Launch Angle');
