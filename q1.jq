for $i in root-file("/mnt/scratch/muellein/root-rumble/Run2012B_SingleMu_small.root", "Events")
let $metGroup := ceiling($i.MET_sumet div ((2000 - 0) div 100) ) mod 100
group by $metGroup
return {"group": if ($i.MET_sumet > 2000) then 100 else $metGroup, "computed": sum($i.MET_sumet), "count": count($i.MET_sumet)}
