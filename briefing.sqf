/* 
* Write your briefing here
* <br /> is line break.
* Note that briefings are added bottom-to-top (appears in reverse order)
*/
#include "config_mission.hpp"

// Add credits first
player createDiaryRecord ["Diary", ["Credits", format ["
<font size=16>%1</font><br/>
<font size=13>by %2</font><br/>
<font size=13>on %3</font><br/>
<br/>
FPARMA Mission Template v5.0.0<br/>
<br/>
<font color='#4ab60c' size='16'>HUGE THANKS TO:</font><br/>
Diwako<br/>
G4rrus<br/>
Latios<br/>
Pilotguy<br/>
Starcat<br/>
CSLeader<br/>

", CFG_ON_LOAD_TITLE, CFG_AUTHOR, getText (configFile >> "CfgWorlds" >> worldName >> "description")]]];

//Secrit Intel
private _specials = ["cmd_1", "recon_1", "recon_2", "recon_3", "recon_4", "recon_5"];
if (player in (_specials apply {missionNameSpace getVariable [_x, objNull]})) then {
player createDiaryRecord ["Diary",["Classified Intel","
<font color='#4ab60c' size='16'>CLASSIFIED INTEL:</font><br/>
SENSITIVE MATERIAL. DO NOT DISSEMINATE WITHOUT PRIOR APPROVAL FROM OSEAN COMMANDING GENERAL.<br/>
<br/>
Yesterday at 1900 hours, a Belkan reconnaissance team made their way into <marker name='marker_castle'>an old castle</marker> and have been suspected to be surveying peacekeeping forces equipment, personnel movement, and OP locations. Intelligence has determined that this recon element is determining the strength of friendly units for a possible future attack by the Belkan forces. However, there is no immediate signs of aggression of massing of troops for a surprise attack.<br/>
<br/>
You have been tasked with infiltrating the castle that the recon team resides in and eliminate any personnel within the compound. This will bring about a confrontation and allow us to enter into the Belkan territory and occupy their pocket.
<br/><br/>
Critical Task: You must not give hints to friendly or enemy forces of your intention before you execute the plan. Secrecy is paramount.
<br/><br/>
If this fails, you will be denounced as a rogue element and executed upon retrieval.
<br/><br/>
SENSITIVE MATERIAL. DO NOT DISSEMINATE WITHOUT PRIOR APPROVAL FROM OSEAN COMMANDING GENERAL.
"]];
};
// Intel
player createDiaryRecord ["Diary",["Mission Settings","
<font color='#4ab60c' size='16'>Respawns:</font><br/>
Player respawn every 10 MINUTES.<br/>
Vehicle Respawn every 5 MINUTES.<br/>
<br/>
<font color='#4ab60c' size='16'>Medical Settings:</font><br/>
Advanced medical ENABLED<br/>
Prevent instant death OFF<br/>
Player Damage Resistance is 4<br/>
"]];

// Intel
player createDiaryRecord ["Diary",["Signals","
SIGNALS AND CALLSIGNS<br/>
All Block channels are on short range 343.<br/>
Callsigns are adjusted to match platoon structure.<br/>
<br/>
Channel 1 UHF: Platoon Net<br/>
--Block 1 Chan. 1 - Alpha<br/>
--Block 1 Chan. 2 - Bravo<br/>
--Block 1 Chan. 3 - Charlie<br/>
--Block 1 Chan. 4 - Delta<br/>
--Block 1 Chan. 5 - 1st Plt Actual<br/><br/>

Channel 2 UHF: Air Net + JTAC<br/>
Channel 3 UHF: Eagle Team Aux. Internal comms<br/><br/>
"]];

// Intel
player createDiaryRecord ["Diary",["Intel","
<font color='#b60c0c' size='18'>HOSTILE FORCES:</font><br/>
Disposition:<br/>
- The Belkan forces are assembled in the northern half of the Chernogorsk Safe Area sector, behind the coastline of the Great Lakes. They are effectively encircled from all sides by peacekeeping forces.<br/>
- As a consequence, the belkan troops in your AOR are reliant on an airbridge formed in their regional base of operations, AFB Helios.<br/>
- Despite this they still retain tight control over key utilities in the Safe Area, as well as several settlements North and East of Chernogorsk.<br/><br/>
Composition<br/>
- Enemy forces in your AOR number at about 3 battalions of heavy infantry, backed by some armor and motorization.<br/>
- Total strength numbers around 1000 combatants for the whole encirclement area.<br/>
- Infantry primarily guards the outer routes of their perimeter and monitors civilian and aid traffic on the roads between AFB Helios and Chernogorsk, with occasional motor patrols.<br/>
- Despite this, the air bridge has managed to supply them with several air assets and supplies for heavy vehicles.<br/>
- A fast response air unit may also be deployed from the airport and un-occupied Belkan territory outside the AO.<br/>
- Due to AFB Helios' historic usage by Belkan strategic forces, there may or may not be a nuclear weapon on-site Do not take your chances, due to nuclear suicide attacks of last summer.<br/>
<br/><br/>
FRIENDLY FORCES<br/>
Composition:<br/>
-Peacekeeper contingent composed out of a mixed company of Osean mechanized troops and Yuktobanian motorized troops.<br/>
-Primary base of operations is AFB Balota.<br/>
-The unit is equipped for fighting in winter conditions and protecting Camp Hope and Port Osprey.<br/>
-Sector forces are augmented by on-site Eagle Squadron, an Osean MiG-29 multirole squadron built as a QRF support element.<br/>
-Inventory: x5 GAZ Tigr MRAP, x2 T-90A Tank, x1 Supply Chinook, various relief and logistics vehicles.<br/>
"]];

// Execution
player createDiaryRecord ["Diary",["Execution","
<font color='#4ab60c' size='18'>MISSION EXECUTION:</font><br/>
<br/>
Standing Orders:<br/>
- Patrol the area and provide assisstance to locals within the region.<br/>
- Uphold the ceasefire.<br/>
- Do not engage hostiles until you ID hostiles and are fired upon.<br/><br/>

``Operation Peaceful Skies VI`` OPORD:<br/>
- Deliver supply vehicles to Camp Hope.<br/><br/>

``Operation Backhand`` contingency order:<br/>
- Confirm that Belkan forces have engaged your positions.<br/>
- Conduct a counter-offensive into Belkan territory.<br/>
- Seize the Gas refinery<br/>
- Seize the Comms tower<br/>
- Capture AFB Helios and arrest any surrendering Belkans<br/>

"]];

// Situation, background
player createDiaryRecord ["Diary",["Situation","
8 November, 1995. 0900 hours.
<br/><br/>
After a war between Belka and allied forces from the nations of Osea and Yuktobania stalled out into a ceasefire culminated from a nuclear suicide strike, the joint peacekeeping forces continue to maintain a presence in territory captured by Belka to provide humanitarian aid, supplies, and stability within the region.
<br/><br/>
Tensions are high. Approximately five months after the fighting ceased, small scale clashes once again broke out after Belkan military officers accused Osea of stirring civil  within its remaining territory, demanding that Osea takes responsibility for its military's action in the occupied sectors. Now, both sides have been gearing up for a possible reigniting of armed conflict despite the United Nations pushing for continued political negotiations.
<br/><br/>
Osean President, Jonathan Porter, denied any such allegations, pointing out that Belkan troops acting of their own accord have deployed artillery in a show of force along the internationally designated safe areas.
<br/><br/>
Leading the joint peacekeeping forces in the Chernogorsk Safe Area are detachments from Osean 4th Mechanized Infantry Brigade, Osean 51st Air Wing, Yukobanian 1st Motorized Infantry Division, and Yukobanian 8th Armored Battalion. The group came into rotation within the area in the past few weeks during the increasing of tensions within the Area of Responsibilities, replacing the troops that have been in the area since fighting ceased in March.
<br/><br/>
Despite an increase in Belkan manpower and air defenses in the immediate vicinity of the Safe Area, Osean air and sea-based logistics continue uninterrupted - keeping morale high with the new troops and established a new tactic of parachuting humanitarian supplies to civilians after ground convoys were stopped by Belkan forces. Winter gear has also been brought in, supplies replenished, and vehicles repainted in time for snow to fall within the region. Fresh and ready to go, these forces continue to provide the peace while also staying alert for potential conflict.
"]];
