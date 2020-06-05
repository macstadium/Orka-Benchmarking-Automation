BEGIN{
#print ARGV[1]
tmp=ARGV[1]
if (tmp~/CAT_/){OS="Catalina"}
if (tmp~/MOJ_/){OS="Mojave"}
if (tmp~/_O.._/){Platform="Orka"}
if (tmp~/_.ST_/){VMType="Static"}
#if (tmp~/_6c/){Hardware="Mac Pro 6C"}
#if (tmp~/_12c/){}
Hardware="Mac Pro 12C 64GB"
if (tmp~/.con0/){concurrency=0}
if (tmp~/.con1/){concurrency=1}
if (tmp~/.local./){storage="local"}
if (tmp~/.Pure./){storage="Pure"}
split(tmp,coreinfo,"_")
machine=coreinfo[7]
datetime=sub(/.txt$/,"",coreinfo[9])
buildinfoproject=coreinfo[5]
if (buildinfoproject=="duck"){
	buildinfoproject="duck_duck_go"
	machine=coreinfo[9]
	datetime=sub(/.txt$/,"",coreinfo[11])
	}
if ((buildinfoproject=="audiokit")||(buildinfoproject=="brave")||(buildinfoproject=="irccloud")||(buildinfoproject=="nextcloud")||(buildinfoproject=="react")||(buildinfoproject=="talk")||(buildinfoproject=="wire")){
	buildinfoproject=coreinfo[5] "_" coreinfo[6]
	machine=coreinfo[8]
        datetime=sub(/.txt$/,"",coreinfo[10])
	}
#print "Time",coreinfo[9]
t=bt=0
}
{
if(($1>0)&&($1<100000000000)){t++;time[t]=$1;count[t]=t}
if($1~/"time":/){
	bt++;
	fmt=$2;
	sub(/^"/,"",fmt);
	sub(/",$/,"",fmt);
	sub(/s/,"",fmt);
	btime[bt]=fmt;
	bcount[bt]=bt;
	}
if ($1~/hw.physicalcpu/){cpuphycores = $2}
if ($1~/hw.ncpu/){cputotalcores =$2}
if ($1~/frequency/){
	freq =$2
	sub(/^"/,"",freq);
	sub(/",$/,"",freq);
	sub(/Mhz/,"",freq);
	}
if ($1~/kern.osrelease/){kern=$2}
if ($1~/Xcode/){Xcode=$2}
if ($1~/Build/){buildversion=$3}
if ($1~/T202.$/){datetime=$1}
if ($1~/hw.memsize/){RAM=$2
		gsub(/,/,"",RAM)
		tRAM=RAM/(1024^3)
#		print tRAM
		RAM=tRAM
		}
}
END{
print "Pipeline,Hardware,Build,Platform,OS,buildinfo.project,buildinfo.type,concurrency,buildinfo.time,Ignore?,Machine,datetime,buildinfo.command.0,buildinfo.command.1,VM type,storage,environment.release,environment.initial_cpu.physical_cores,environment.initial_cpu.total_cores,environment.initial_cpu.frequency,environment.initial_memory.total"
for (loop=1;loop<=t;loop++){
	print OS Platform Hardware cpuphycores cputotalcores "," Hardware "," count[loop] "," Platform"," OS "," buildinfoproject "withPython,Swift," concurrency "," time[loop] ",," machine "," datetime "," Xcode "," buildversion "," VMType "," storage "," kern "," cpuphycores "," cputotalcores "," freq "," RAM ""
	}
for (loop=1;loop<=bt;loop++){
print OS Platform Hardware cpuphycores cputotalcores "," Hardware "," bcount[loop] "," Platform"," OS "," buildinfoproject ",Swift," concurrency "," btime[loop] ",," machine "," datetime ","Xcode","buildversion"," VMType "," storage "," kern "," cpuphycores "," cputotalcores "," freq "," RAM ""
#	print OS Platform Hardware cpuphycores cputotalcores,Hardware,bcount[loop],Platform,OS,buildinfoproject,"Swift",concurrency,btime[loop],,machine,datetime,"xcodebuild","clean",Platform,storage,kern,cpuphycores,cputotalcores,,RAM ""
	}
}
