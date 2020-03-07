class Application
  def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

     if req.path=="/items/<ITEM NAME>"
       item = req.params["item"]
       resp.write Item.find_by(name, "#{item}").price
     else
       resp.write "Route not found"
       resp.status = 404
     end

     resp.finish
   end
end
