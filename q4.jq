let $bucketWidth := (2000 - 0) div 100.0
let $bucketCenter := $bucketWidth div 2
for $i in root-file("/mnt/scratch/muellein/root-rumble/Run2012B_SingleMu_small.root", "Events")
    let $subCount := count(for $j in size($i.Jet_pt)
        where $i.Jet_pt[$j][] gt 40 and abs($i.Jet_eta[$j][]) lt 1
        return $i.Jet_pt[$j][])
    let $filter := (for $j in $subCount where $j gt 1 return $j)
    let $sumet := if $filter[] gt 1 then $i.MET_sumet
    return $sumet

