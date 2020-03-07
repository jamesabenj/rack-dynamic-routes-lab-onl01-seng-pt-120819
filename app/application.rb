class Application
  def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/songs/").last
      item = @@items.find{|i| i.name == item_name}
      if @@items.include?(item)
         item.price
      else
         resp.status = 400
         resp.write "Item not found"
      end
      binding.pry
    else
       resp.write "Route not found"
       resp.status = 404
    end
     resp.finish
   end
end
