class Application
  def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

     if req.path=="/items/<ITEM NAME>"
      item = req.params["<ITEM NAME>"]
      @@items.each do |i|
        if i.name = item
        resp.write i.price
        end
      end
     else
       resp.write "Route not found"
       resp.status = 404
     end

     resp.finish
   end
end
