class Application
  def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

     if req.path=="/items/<ITEM NAME>"
      item = req.params["item"]
      if @@items.include?(item)
      resp.write Item.find_by(name, "#{item}").price
      else
        resp.status = 400
        resp.write "Item not found"
     else
       resp.write "Route not found"
       resp.status = 404
     end

     resp.finish
   end
end
