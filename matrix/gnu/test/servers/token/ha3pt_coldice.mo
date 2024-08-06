model h3pt_coldice "Description"
    
    Real time = -21;
    Real time_interval = 1;

    Real x = -1;
    Real y = -1;
    Real z = -1;

    Real x_velocity = 0;
    Real y_velocity = 0;
    Real z_velocity = 0;

    Real mass = 1;
    Real radius = 1;

    Real gravity = 9.81;
    Real drag_coefficient = 0.47;
    Real air_density = 1.225;
    Real air_speed = 30;

    Real energy_consumption = 0;
    Real fuel_consumption = 0;
    Real fuel_capacity = 100;
    Real fuel_consumption_rate = 0.01;
    Real fuel_price = 0.5;
    Real fuel_price_min = 0.2;
    Real fuel_price_max = 0.8;

    Real thrust = 0;
    Real rotation_speed = 0;
    Real rotation_axis_x = 0;
    Real rotation_axis_y = 0;
    Real rotation_axis_z = 0;
    Real rotation_angle = 0;

    Real fuel_level = fuel_capacity;
    Real fuel_price_current = fuel_price_min;
    Real fuel_price_change_rate = 0.001;
    Real fuel_price_change_direction = 1;
    Real fuel_price_change_time = 0;
    Real fuel_price_change_time_interval = 3600;

equation
        x_velocity = thrust * cos(rotation_angle) * time_interval / mass;
        y_velocity = thrust * sin(rotation_angle) * time_interval / mass;
        z_velocity = -gravity * time_interval / mass;
        x = x_velocity * time_interval;
        y = y_velocity * time_interval;
        z = z_velocity * time_interval;
    
end h3pt_coldice;