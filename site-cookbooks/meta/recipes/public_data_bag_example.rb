# http://ed.victavision.co.uk/blog/post/21-7-2012-chef-solo-data-bags
public_items = data_bag('public')
public_items.each do |public_item|
  item = data_bag_item('public', public_item)
  log "item = #{item.inspect}"
end
