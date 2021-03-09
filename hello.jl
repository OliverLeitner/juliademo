#println("hello world")
#mysuperdupermathvar = 3333 + 2222 + 11111
#println("type of that math var: ", typeof(mysuperdupermathvar))
#println("just wanna know something...")
#firstvar = readline()
#println("something was: ", firstvar)

# and this might be a comment
#print("enter something: ")
#line = readline()
#println("youve entered: ", line)

#using Sockets

#server = listen(IPv4(0), 8080) #0 listens on any ip
#while true
#  conn = accept(server)
#  @async begin
#    try
      #while true
        #line = readline(conn)
        #write(conn,line)
#      println("Hello World\n")
      #end
#    catch err
#      print("connection ended with error $err")
#    end
#  end
#end

#@async begin
#    server = listen(IPv4(0), 8080)
#    while true # always true... thats a never ending loop... old trick...
#        sock = accept(server)
#        println("Hello World\n")
#    end
#end

logfile = ""

samplearray = ["element 1", "element 2", "element 3", "element 4"]

# base julia funct struct
function readIndex()
    return read(open("index.html"), String)
end

# logfile
function openLog()
    logfile = open(string("log-", today(), ".log"), "w")
end

# using date functions
#using Dates

#serving
#using HTTP

#HTTP.listen("0.0.0.0", 8080) do http::HTTP.Stream
    #@show http.message #logs in terminal
    #@show HTTP.header(http, "Content-Type") #logs in terminal
    # more logging below
    #while !eof(http)
    #    println("body data: ", String(readIndex())) #save mode?
    #end
#    HTTP.setstatus(http, 200)
    #HTTP.setheader(http, "Foo-Header" => "bar") #man in the middle... literally
#    HTTP.startwrite(http)
#    write(http, readIndex())
    #write(http, "more response body")
#end

#using HTTP

#HTTP.serve("0.0.0.0", 8080) do request::HTTP.Request
#   @show request
#   @show request.method
#   @show HTTP.header(request, "Content-Type")
#   @show HTTP.payload(request)
#   try
#       return HTTP.Response(readIndex())
#   catch e
#       return HTTP.Response(404, "Error: $e")
#   end
#end

using Genie, Genie.Router
using Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json

route("/") do
    html(Genie.Renderer.Html.read_template_file("./partial.html"), name="Oliver Leitner", samplearray=samplearray)
end

route("/hello") do
    #html(readIndex()) # reads cleanly... if you want text, you gotta say it
    html(Genie.Renderer.Html.read_template_file("./index.html"))
end

Genie.up(8080, "0.0.0.0", async=false)