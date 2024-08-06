model kc0dx_sun_cold "Description"
    
    Real time = -21;
    Real space = 0.001;
    Real temperature = 298.15;
    Real pressure = 101325;
    Real density = pressure / (8.31447 * temperature);
    Real specific_heat = 1005.0;
    Real viscosity = 1.7894e-5;
    Real thermal_conductivity = 2.18e-5;
    Real diffusivity = viscosity / (density * specific_heat);
    Real heat_capacity = specific_heat * density;
    Real surface_area = 4 * 6.96e8;
    Real surface_heat_transfer_coefficient = 1e-4;
    Real radiation_flux = 3.84e26;
    Real heat_transfer_coefficient = 0.02 * surface_area * surface_heat;
    Real heat_source_term = 0;
    Real boundary_condition_temperature = 273.15;
    Real initial_temperature = 273.15;
    Real final_temperature = 300;
    Real time_step = 3600;


end kc0dx_sun_cold;