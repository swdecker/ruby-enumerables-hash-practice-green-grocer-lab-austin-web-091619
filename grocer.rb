def consolidate_cart(cart)
 
  cart_hash = {}
  cart.map do |item_hash|
    #cart passes in a hash
    
    #item is the item name, keys returns an array and we want just the first value
    item = item_hash.keys[0]
    
    #if items in the cart, increment, otherwise put it in the cart
    if cart_hash.has_key?(item)
      cart_hash[item][:count] +=1
    else
      cart_hash[item]= item_hash[item]
      cart_hash[item][:count] = 1
    end
    
  end
  
  cart_hash
end

def apply_coupons(cart, coupons)
  # code here
  coupons.map do |coupon|
    #coupon is a hash with three keys: item,num, and cost
    
    #if the coupon item is in the cart add a new item to the cart
    #item W/ COUPON that starts the same as the cart item, but has a different price and count
    item = coupon[:item]
    coupon_item = "#{coupon[:item]} W/COUPON"
    if cart[item] && cart[item][:count] >= coupon[:num]
      #turn cost into a price per item
      pricer = coupon[:cost] / coupon[:num]
        if cart[coupon_item]
          cart[coupon_item] = {price: pricer, clearance: cart[item][:clearance], count: cart[coupon_item][:count] + coupon[:num]}
        else
          cart[coupon_item] = {price: pricer, clearance: cart[item][:clearance], count: coupon[:num]}
        end
      #cart[coupon_item][:price] = pricer
      #cart[coupon_item][:count] = coupon[:num]
      
      #original item count less the coupon num
      cart[item][:count] -= coupon[:num]
    end
  end
  
  cart
end

def apply_clearance(cart)
  # code here
  cart.map do |item_hash|
    item = item_hash.keys[0]
    if cart[item][:clearance]
      cart[item][:price] *= 0.8
    end
    
  end
end

def checkout(cart, coupons)
  # code here
end
