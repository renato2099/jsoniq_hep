for $i in root-file("/mnt/scratch/muellein/root-rumble/Run2012B_SingleMu_small.root", "Events")
let $jetSum := sum(members($i.Jet_pt))
let $metGroup := if ($jetSum < 15) then 0 else if ($jetSum lt 60) then ceiling($jetSum div ((60 - 15) div 100) ) mod 100 else 99
group by $metGroup
return {"group": $metGroup, "count": count($jetSum)}
