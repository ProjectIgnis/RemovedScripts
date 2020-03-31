--Castle of Dark Illusions (DOR)
--scripted by GameMaster (GM)
local s,id=GetID()
function s.initial_effect(c)
--+500 atk/def fiend monsters
local e1=Effect.CreateEffect(c)
e1:SetType(EFFECT_TYPE_FIELD)
e1:SetCode(EFFECT_UPDATE_ATTACK)
e1:SetRange(LOCATION_MZONE,0)
e1:SetTarget(aux.TargetBoolFunction(Card.IsRace,RACE_FIEND))
e1:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
e1:SetValue(500)
e1:SetCondition(s.con)
c:RegisterEffect(e1)
local e2=e1:Clone()
e2:SetCode(EFFECT_UPDATE_DEFENSE)
c:RegisterEffect(e2)
end

function s.con(e)
return e:GetHandler():IsDefensePos()
end

