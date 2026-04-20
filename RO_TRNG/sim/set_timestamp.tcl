# 设置目标路径
set target_path "E:/Project/RO_TRNG/sim"

# 进入目标路径
cd $target_path

# 获取当前系统时间
set current_time [clock format [clock seconds] -format "%Y%m%d%H%M%S"]

# 打开文件并写入时间
set file_handle [open "timestamp.txt" w]
puts $file_handle $current_time
close $file_handle

# 输出提示信息
puts "当前系统时间已写入文件：timestamp.txt"