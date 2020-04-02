for $i in root-file("/mnt/scratch/muellein/root-rumble/Run2012B_SingleMu_small.root", "Events")
let $bucketWidth := (2000 - 0) div 100
let $filtered := 
    if ($i.MET_sumet < 0) then
        0
    else
        if ($i.MET_sumet lt 2000) then $i.MET_sumet
        else 2000
let $value := round(($filtered - 10) div $bucketWidth ) * $bucketWidth + 10
group by $value
order by $value
return {"x": $value, "y": count($i.MET_sumet)}
