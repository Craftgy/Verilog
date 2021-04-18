echo "开始编译"
   
iverilog -o add_4 add_4.v add_4_test.v

echo "编译完成"

echo "生成波形文件"

vvp add_4 

echo "打开波形文件"

open -a Scansion  add_4 .vcd