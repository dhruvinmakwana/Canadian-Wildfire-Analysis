delete  from `coherent-rite-343617.wildfire_Data.pointsdata`where FID in (select FID from `coherent-rite-343617.wildfire_Data.pointsdata` where REP_DATE is null );