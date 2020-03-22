for $i in root-file("/mnt/scratch/muellein/root-rumble/Run2012B_SingleMu_small.root", "Events")
let $metGroup := if ($i.MET_sumet < 0) then 0 else if ($i.MET_sumet lt 2000) then ceiling($i.MET_sumet div ((2000 - 0) div 100) ) mod 100 else 100
group by $metGroup
return {"group": $metGroup, "computed": sum($i.MET_sumet), "count": count($i.MET_sumet)}
