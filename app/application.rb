class Application
  def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

     if req.path.match(/items/)
       item_name = req.path.split("/songs/").last
       if @@items.find{|i| i.name == item_name}
  
        end
      end
     else
       resp.write "Route not found"
       resp.status = 404
     end

     resp.finish
   end
end
