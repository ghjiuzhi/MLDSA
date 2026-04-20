set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -hierarchical -filter {NAME =~ *u_RO/RO_*AND.u_LUT6_*and2_1/in0*}]

# RO1 12
# create_clock -period 0.667 -name clk_ro [get_nets -hierarchical -filter {NAME =~ *u_RO/ro_chain[0]*}]
# RO2 25
# create_clock -period 0.824 -name clk_ro [get_nets -hierarchical -filter {NAME =~ *u_RO/ro_chain[1]*}]
# RO3 30
# create_clock -period 1.639 -name clk_ro [get_nets -hierarchical -filter {NAME =~ *u_RO/ro_chain[2]*}]
# RO4 30
# create_clock -period 1.639 -name clk_ro [get_nets -hierarchical -filter {NAME =~ *u_RO/ro_chain[3]*}]
