
#include "config.sqf"

if (isServer) then {
APOC_srv_startAirdrop = compile preprocessFileLineNumbers "custom\APOC_Airdrop_Assistance\APOC_srv_startAirdrop.sqf";
serv_fillAirdrop = compile preprocessFileLineNumbers "custom\APOC_Airdrop_Assistance\serv_fillAirdrop.sqf";
processItems = compile preprocessFileLineNumbers "custom\APOC_Airdrop_Assistance\processItems.sqf";

//A3Wasteland Functions (AgentRev and crew)
getBallMagazine = compile preprocessFileLineNumbers "custom\APOC_Airdrop_Assistance\getBallMagazine.sqf";
fn_findString = compile preprocessFileLineNumbers "custom\APOC_Airdrop_Assistance\fn_findString.sqf";

diag_log "APOC_Airdrop_Assistance functions compiled on Server";
};
