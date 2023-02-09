-- press right shift to be invincible

local isInvincible = false

function onKeyPress(key)
  if key == "right shift" then
    isInvincible = not isInvincible
  end
end

function onTakeDamage(amount)
  if isInvincible then
    -- do nothing
  else
    -- apply damage
  end
end
