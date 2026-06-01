#A function that seeks to auto reload the server when this function fails to load.
#Some Cobblemon commands only work when a server is reloaded


#tags the armor stand for a ReloadCheck.
return run tag @e[x=-792,y=65,z=-284,dy=3] add ReloadCheck

#Purposeful command that errors out unless reloaded
npcspawn goldenrod_officerjenny
npcspawn buck_salon
npcspawn marley_salon
npcspawn cheryl_salon
npcspawn mira_salon
npcspawn riley_salon