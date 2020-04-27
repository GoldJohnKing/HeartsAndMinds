<h1>COVID-19 (2019-nCoV) 疫情防控阻击战 by GoldJohnKing</h1>

<p>
【如果你希望在你的服务器上使用本任务，请务必先联系我。QQ群：274455383】 

本任务可能不会在创意工坊及时更新，如需获取最新版本的任务文件，请认准本地址。
创意工坊链接：https://steamcommunity.com/sharedfiles/filedetails/?id=1991931521

近日，全世界爆发了名为COVID-19 (2019-nCoV) 的新型冠状病毒疫情。为了使人民群众更好地理解病毒的传播特性，体会一线医疗人员的困难与艰辛，特此制作本任务。 

任务中，玩家将作为NATO下辖的疫情处置小组成员，对Altis地区的2019-nCoV新型冠状病毒疫情进行控制。由于医疗救援物资运输及时，并对当地居民进行了行之有效的宣传，部分平民已经购买并佩戴口罩。IDAP也及时派出了有关人员，由佩戴全套防护服及呼吸器的专业医师参与当地疫情防控工作。然而由于当地相对欠发达，缺乏有效的垃圾分类与回收机制，平民的生活习惯又难以在短期内改变，因此城镇中依然可能出现平民随意丢弃的受污染物体。当地的反政府武装组织也趁乱扩张，给当地人民的日常生活和疫情防控工作带来了极大阻力。 

本任务基于 心灵与智慧 Hearts & Minds 任务框架修改而成，在保留原有任务风格的基础上，增加了与疫情防控有关的特色内容，增加了更加符合现实情况的病毒动态传染模型，包括人传人和污染物传染等传染途径，并设有可用的口罩、面罩、防护服、呼吸器等CBRN（生化核辐）防护装备（用于隔绝传染和减少交叉感染），以及化学探测器（用于粗略测定物体是否受到感染）、ED-1E探测无人机（用于精确分析物体是否受到感染）和喷淋净化装置（用于消除病毒感染）等。 

病毒的动态传染模型设计如下： 
受污染物体的病毒传染范围为5米，受感染人员的的病毒传染范围为7.5米，单次传染几率均为25%。一次完整的传染运算周期为7.5秒。（在5秒内对所有相关物体进行逐个计算，然后暂停2.5秒，再开始下一轮计算；而非每隔7.5秒进行一次包含所有相关物体的完整运算。） 

由以上描述可以计算得知，在无任何保护措施的情况下，单一感染源的7.5秒、15秒、30秒、45秒和60秒传染概率分别为：25%、43.8%、68.5%、82.2%和90.0%。也就是说，处在受感染人员或物体的传染范围内的时间越长，感染几率越大。 

穿戴CBRN（生化核辐）防护装备会同时降低被病毒传染的可能性和将病毒传染给他人的可能性。穿戴不同的CBRN防护装备会获得的不同的防护级别，从而获得不同的传播/受感染几率减免，单次传染运算的几率减免如下（比例越高代表防护界别越低，的传播/受感染几率减免越低，单位越容易传播病毒或受到感染，0%为完全防护，100%为完全无防护）： 
口罩：90% 
口罩+防护服：80% 
口罩+呼吸过滤背包：80% 
CBRN面罩：70% 
CBRN面罩+防护服：20% 
CBRN面罩+呼吸过滤背包：60% 
防护服：90% 
呼吸过滤背包：90% 
防护服+呼吸过滤背包：80% 
CBRN面罩+防护服+呼吸过滤背包（全套CBRN装备）：0%（既不会传染别人，也不会被别人传染，但乘坐载具时依然会将病毒传播给载具和载具中的所有物体） 

在计算防护级别时，传播概率和受感染概率是分别依次计算的，即若传染源和未感染者均佩戴了口罩，则传播概率是90%，受感染概率为90%，未感染者的实际单次传染的几率减免为90% * 90% = 81%，再考虑到25%的基本传染几率，则未感染者在单次传染计算中受到感染的几率为90% * 90% * 25% = 20.25%。 
任务生成的所有单位（含平民、敌军、载具及各类物体）中，有约5%会成为初始传染源（即生成时就已经感染）。无论感染与否，任务生成的人员单位（平民和敌军）均会在城镇内或城镇间游荡。未感染人员若与感染源出现密切接触，将可能会被传染。由于任务生成的人员单位可能存在一定程度的群聚情况，因此也存在发生聚集性感染的可能。 

出于性能原因，任何感染源均不会将病毒传染给物体或物件，但传染源会在进入载具或作为货物装载进集装箱时污染整个载具/集装箱和其中所有物体。 

尸体也会传播病毒，使用尸袋可以隔绝其传染性。 

受感染人员的惩罚机制： 
受感染者将持续受到伤害，直至死亡或使用净化淋浴来清理他们的身体为止。任务生成的AI单位（平民和敌军）的伤害每7.5秒生成一次，玩家单位的伤害每3秒生成一次。单次伤害的最小值为0，最大值为0.25。穿着全套的CBRN装备可以保护你免受感染，但已经受到感染的人员依然会受到伤害。穿着CBRN防护装备可以获得伤害生成几率减免，穿着全套CBRN装备时受到伤害的几率是未穿戴任何防护装备时的1/6。 

感染的消除方法： 
在喷淋净化装置下进行净化喷淋，即可消除感染。小型淋浴器只能用来净化单兵单位，大型淋浴器则可以用来清洗人员、物品、车辆和集装箱（包含其中所有人员和物体）。要完成净化过程，只需待在淋浴下，等待约10秒即可。 

感染的探测方法： 
你可以使用化学探测器（属于手表类装备，在默认键位设定下可以连续按两次O键打开）检测你是否处于感染区域内。威胁度介于0.1至0.9之间意味着5米以外存在传染源，威胁度等于1意味着0-5米以内存在感染源。你也可以使用ED-1E无人机的探针来分析物体、车辆或人，以测定其是否受到感染。ED-1E无人机具有后现代化的高科技纳米自洁技术，因此永远不会受到感染。 

目前任务内主要包括以下几种任务类型： 
运送医疗物资 
维修救援车辆 
调查疑似病例 
抓捕可疑流窜人员 
收治疑似病例 
护送临床数据 
清理病毒污染区域 

防控疫情 众志成城 武汉加油 中国加油 

本任务可能不会在创意工坊及时更新，如需获取最新版本的任务文件，请认准本地址。
创意工坊链接：https://steamcommunity.com/sharedfiles/filedetails/?id=1991931521

【如果你希望在你的服务器上使用本任务，请务必先联系我。QQ群：274455383】 
</p>

<br>

<h1>Original Description</h1>

<p align="center">
    <img src="https://data.bistudio.com/assets/img/badges/medal/MWFMP.png" width="85">
    <img src="http://www.armaholic.com/datas/users/btc_revive_a3_4.png" width="210">
    <img src="https://data.bistudio.com/assets/img/badges/medal/MWFMP.png" width="85">
</p>

<p align="center">
    <a href="https://github.com/Vdauphin/HeartsAndMinds/releases/tag/1.20.3">
        <img src="https://img.shields.io/badge/Version-1.20.3-blue.svg?style=flat-square" alt="H&M Version">
    </a>
    <a href="http://www.somsubhra.com/github-release-stats/?username=vdauphin&repository=HeartsAndMinds">
        <img src="https://img.shields.io/github/downloads/Vdauphin/HeartsAndMinds/total.svg?style=flat-square&label=Downloads" alt="H&M Downloads">
    </a>
</p>

Hearts and Minds is a cooperative Military Simulation (MilSim) mission that aims to recreate a post war environment based on an insurgency gameplay.
CSAT forces retreated from Altis and NATO deployed units and vehicles to help the local population.
A new formed group, known as "Oplitas", is against the NATO intervention and is ready to fight.

Online [wiki available](http://vdauphin.github.io/HeartsAndMinds/).

### The mission has a lot of features:

- **Dedicated server support only**
- Dynamic battlefield
    - Enemies and civilian spawn randomly
    - Random patrol and traffic
    - Dynamic caching system to save performance
    - Extend battlefield to sea (you are not safe on sea!)
- Reputation system
    - Realistic IED/Suicide/Drone bomber system
    - Civilian interaction
        - Orders
        - Request a lift
        - Discussion (interpreter)
        - Fleeing
    - More than 17 side mission
- Deep ACE3 support
    - Use mainly ACE interaction
    - Rearm system
    - ACEX Fortify
- Logistic system
    - Tow
    - Lift
    - Repair destroyed vehicles
    - FOB/Rallypoints
- Gameplay elements
    - Intel about cache and hideout
    - Chemical Warfare
    - Spectrum devices
- Under the hood
    - A lot of optional gameplay
    - More than 284 enemies and 24 civilians factions available
    - Full saving Database (even player markers)
    - Easy map change
    - Auto Headless support
- Something I forgot for sure


Your main task is to defeat the "Oplitas" group and restore peace and order in Altis.
The militia has an unknown number of hideouts in the island that need to be destroyed.
They have also ammo caches in various locations, destroy them to weaken its power.

Bad actions cause bad effects.
Infact there's a reputation system: helping the local population, fighting the "Oplitas", disarming IED will rise your reputation; killing civilians, mutilate alive/dead civilian, firing near civilians for no reason, damaging/destroying buildings, losing vehicles, respawns will decrease your reputation.
At the beginning you have a very low reputation level, so civilians won't help you revealing important information about Oplitas, they will likely lie instead.

<p align="center">
    <img src="https://user-images.githubusercontent.com/14364400/28997116-bfcec8a6-7a0d-11e7-911f-b52edb841ae3.png" width="400">
    <img src="https://user-images.githubusercontent.com/14364400/29193966-d8306378-7e27-11e7-97cb-df76dfc08e53.png" width="400">
</p>

Any support or feedback is always welcome and appreciated!

### Credits:
- =BTC= clan
- [Contributors](https://github.com/Vdauphin/HeartsAndMinds/graphs/contributors)
