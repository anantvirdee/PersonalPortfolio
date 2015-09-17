class MyMiddleware
  def initialize(app)
    @app = app #Store the app to call it down the stack
  end

  def call(env)
    # Initialize stuff before entering 'rails'
    # Retrieve a connection form a pool (Redis, Memcache, etc.)
    # Authentication/authorization/tenancy setup needs to be done before
    # Remember, you can set stuff in env and then access it in your controller.

    # The response has the same structure as before:
    # [200, {"Content-Type" =&gt; "text/html"}, ["Hello Rack!"]]
    # The header is now fully populated and instead of the "Hello Rack!",
    # the body is a full HTML page.

    # @app.call will call ActionDispatch::Static which, in turn, will call ActiveSupport::CacheStrategy which will
    # call Rack::Runtime and so on up to your controller/view.
    response = @app.call(env)

    # Analytics could go here.
    # If you want to throttle connection, you could increment it here too
    response
  end
end