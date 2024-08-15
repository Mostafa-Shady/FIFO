vlib Work 

vlog FIFO.v FIFO_TB.v

vsim -voptargs=+acc work.FIFO_TB

add wave *

add wave -position insertpoint  \
sim:/FIFO_TB/DUT/mem

run -all

#quit -sim