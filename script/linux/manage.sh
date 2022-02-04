#抄来抄去的，我来帮你们抽象化一下，方便下一个人抄哈
#@Author KMinerProxy

BINARY_URL="https://raw.githubusercontent.com/KMinerProxy/KMinerProxy/main/releases/latest/kminerproxy_linux_amd64"
LOOP_RUN_URL="https://raw.githubusercontent.com/KMinerProxy/KMinerProxy/main/script/linux/looprun.sh"

INSTALL_PATH="/root/kminer" #如果你想变更安装位置的话，请编辑该值
BINARY_PATH="$INSTALL_PATH/KMinerProxy"
LOOP_RUN_PATH="$INSTALL_PATH/looprun.sh"

SCREEN_NAME="KMinerProxy" #如果你想变更运行SCREEN名称的话，请编辑该值

#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi


echo "======================================================="

install() {
    if [ -d $INSTALL_PATH ]; then
        echo -e "您已安装了该软件,如果确定没有安装,请输入rm -rf $INSTALL_PATH" && exit 1
    fi
    if screen -list | grep -q "$SCREEN_NAME"; then
        echo -e "检测到您已启动了KMinerProxy,请关闭后再安装" && exit 1
    fi

    $cmd update -y
    $cmd install curl wget screen vim -y
    mkdir $INSTALL_PATH

    wget $BINARY_URL -O $BINARY_PATH

    chmod 777 $BINARY_PATH

    wget $LOOP_RUN_URL -O $LOOP_RUN_PATH
    chmod 777 $LOOP_RUN_PATH
    echo "如果没有报错则安装成功"
    echo "正在启动..."
    screen -dmS $SCREEN_NAME
    sleep 0.2s
    screen -r $SCREEN_NAME -p 0 -X stuff "cd $INSTALL_PATH"
    screen -r $SCREEN_NAME -p 0 -X stuff $'\n'
    screen -r $SCREEN_NAME -p 0 -X stuff "./looprun.sh"
    screen -r $SCREEN_NAME -p 0 -X stuff $'\n'
    sleep 1s
}

uninstall() {
    read -p "是否确认删除KMinerProxy[yes/no]：" flag
    if [ -z $flag ]; then
        echo "输入错误" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ]; then
            screen -X -S $SCREEN_NAME quit
            rm -rf $INSTALL_PATH
            echo "卸载KMinerProxy成功"
        fi
    fi
}

update() {
    if screen -list | grep -q "KMinerProxy"; then
        screen -X -S KMinerProxy quit
    fi
    rm -rf $BINARY_PATH
    install
    sleep 1s
    echo "您可运行 screen -r $SCREEN_NAME 来管理程序"
}

start() {
    if screen -list | grep -q "$SCREEN_NAME"; then
        echo -e "KMinerProxy已启动,请勿重复启动" && exit 1
    fi
    screen -dmS $SCREEN_NAME
    sleep 0.2s
    screen -r $SCREEN_NAME -p 0 -X stuff "cd /root/miner_proxy"
    screen -r $SCREEN_NAME -p 0 -X stuff $'\n'
    screen -r $SCREEN_NAME -p 0 -X stuff "./run.sh"
    screen -r $SCREEN_NAME -p 0 -X stuff $'\n'

    echo "KMinerProxy已启动"
    echo "您可以使用指令screen -r $SCREEN_NAME 来管理程序"
}

restart() {
    if screen -list | grep -q "$SCREEN_NAME"; then
        screen -X -S $SCREEN_NAME quit
    fi
    screen -dmS $SCREEN_NAME
    sleep 0.2s
    screen -r $SCREEN_NAME -p 0 -X stuff "cd $INSTALL_PATH"
    screen -r $SCREEN_NAME -p 0 -X stuff $'\n'
    screen -r $SCREEN_NAME -p 0 -X stuff "./runloop.sh"
    screen -r $SCREEN_NAME -p 0 -X stuff $'\n'

    echo "KMinerProxy 重新启动成功"
    echo "您可运行 screen -r $SCREEN_NAME 来管理程序"
}

stop() {
    if screen -list | grep -q "$SCREEN_NAME"; then
        screen -X -S $SCREEN_NAME quit
    fi
    echo "KMinerProxy 已停止"
}

change_limit(){
    num="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 102400" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为102400,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

check_limit(){
    echo -n "当前连接数限制："
    ulimit -n
}

go_screen(){
  screen -r -d $SCREEN_NAME
}


echo "======================================================="
echo "KMinerProxy管理工具-V1"
echo "  1、安装(安装到$INSTALL_PATH)"
echo "  2、卸载"
echo "  3、更新"
echo "  4、启动"
echo "  5、重启"
echo "  6、停止"
echo "  7、解除linux系统连接数限制(需要重启服务器生效)"
echo "  8、查看当前系统连接数限制"
echo "  9、查看控制台(键入ctrl+a+d返回)"
echo "======================================================="
read -p "$(echo -e "请选择[1-8]：")" choose
case $choose in
1)
    install
    ;;
2)
    uninstall
    ;;
3)
    update
    ;;
4)
    start
    ;;
5)
    restart
    ;;
6)
    stop
    ;;
7)
    change_limit
    ;;
8)
    check_limit
    ;;
9)
    go_screen
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac
