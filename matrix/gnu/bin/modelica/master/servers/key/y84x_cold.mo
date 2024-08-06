model y8x_cold "Description"
    
    Real time = -21;
    Real price = 0.0;
    Real demand = 0.0;
    Real supply = 0.0;
    Real profit = 0.0;
    Real profit_margin = 0.0;
    Real revenue = 0.0;
    Real variable_cost = 0.0;
    Real fixed_cost = 0.0;
    Real total_cost = 0.0;
    Real inventory = 0.0;
    Real holding_cost = 0.0;
    Real inventory_turnover = 0.0;
    Real holding_period = 0.0;
    Real order_quantity = 0.0;
    Real order_cost = 0.0;
    Real order_lead_time = 0.0;
    Real order_lead_time_variance = 0.0;
    Real order_frequency = 0.0;
    Real order_size = 0.0;
    Real order_size_variance = 0.0;
    Real order_priority = 0.0;
    Real order_processing_time = 0.0;
    Real order_processing_time_variance = 0.0;
    Real order_routing_time = 0.0;
    Real order_routing_time_variance = 0.0;
    Real order_due_date_variance = 0.0;
    Real order_delivery_time_variance = 0.0;
    Real order_discount_variance = 0.0;
    Real order_tax_variance = 0.0;

equation 

    // Constraints
    demand = inventory + order_quantity;
    supply = inventory - order_quantity;
    price = demand;
    profit = revenue - total_cost;
    profit_margin = profit / price;
    revenue = price * demand;
    variable_cost = order_cost + holding_cost;
    fixed_cost = 0;
    total_cost = variable_cost + fixed_cost;
    inventory = inventory + order_quantity - demand;
    holding_cost = inventory * holding_period;
    inventory_turnover = demand / (supply + demand);
    holding_period = 1 / inventory_turnover;
    order_quantity = order_size * order_frequency;
    order_cost = order_quantity * price;
    order_lead_time = order_size / price;
    order_lead_time_variance = order_size_variance / (order_size * price);
    order_frequency = demand / (order_quantity * price);
    order_size = price * order_frequency;
    order_size_variance = price * order_frequency_variance;
    order_priority = 1;
    order_processing_time = 0;
    order_processing_time_variance = 0;
    order_routing_time = 0;
    order_routing_time_variance = 0;
    order_due_date_variance = 0;
    order_delivery_time_variance = 0;
    order_discount_variance = 0;
    order_tax_variance = 0;





end y8x_cold;