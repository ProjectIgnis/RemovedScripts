--Negative Energy
--original script by Shad3
local s,id=GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetTarget(s.act_tg)
	e1:SetOperation(s.act_op)
	c:RegisterEffect(e1)
end
function s.act_fil(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_DARK)
end
function s.act_tg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.act_fil,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
	local g=Duel.GetMatchingGroup(s.act_fil,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
	Duel.SetOperationInfo(0,CATEGORY_ATKCHANGE,g,0,0,0)
end
function s.act_op(e,tp,eg,ep,ev,re,r,rp)
	local tg=Duel.GetMatchingGroup(s.act_fil,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
	if #tg>0 then
		local tc=tg:GetFirst()
		local c=e:GetHandler()
		while tc do
			local e1=Effect.CreateEffect(c)
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_SET_ATTACK_FINAL)
			e1:SetReset(RESET_EVENT+RESETS_STANDARD)
			e1:SetValue(tc:GetAttack()*2)
			tc:RegisterEffect(e1)
			tc=tg:GetNext()
		end
	end
end