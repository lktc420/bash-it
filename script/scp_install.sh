cluster=(172.16.1.81 172.16.1.82 172.16.1.83 172.16.1.84)
srcs=("/usr/lib/hive/lib/hive-*transwarp.jar" "/usr/lib/ngmr/core/target/scala-2.10/ngmr-core_2.10-1.1.0-transwarp.jar" "/usr/lib/ngmr-shell/target/scala-2.10/ngmr-shell_2.10-1.1.0-transwarp.jar")
dsts=("/usr/lib/hive/lib/" "/usr/lib/ngmr/core/target/scala-2.10/" "/usr/lib/ngmr-shell/target/scala-2.10/")

if [ "$1" == "hive" ];then
  indexes=(0)
elif [ "$1" == "spark" ];then
  indexes=(1)
elif [ "$1" == "inceptor" ]; then
  indexes=(2)
elif [ "$1" == "all" ]; then
  indexes=(0 1 2)
else
  echo "Unknown option: $1"
  exit 1
fi

if [ $# -gt 1 ];then
  temp=($@)
  nodes=${temp[@]:1}
else
  nodes=${cluster[@]}
fi

for node in ${nodes[@]};do
  echo "Deploying $1 to node $node ..."
  for index in ${indexes[@]};do
  echo "scp ${srcs[$index]} root@$node:${dsts[$index]}"
  scp ${srcs[$index]} root@$node:${dsts[$index]}
  done
done

