module Admin
  class Engine < ::Rails::Engine
    ROOT_PATH = Pathname.new(File.join(__dir__, ".."))

    isolate_namespace Admin

    initializer "admin.assets.precompile" do |app|
        app.config.assets.precompile += %w( *.js *.css )
    end

    initializer "webpacker.proxy" do |app|
        insert_middleware = begin
                            Admin.webpacker.config.dev_server.present?
                          rescue
                            nil
                          end
        next unless insert_middleware

        app.middleware.insert_before(
          0, Webpacker::DevServerProxy,
          ssl_verify_none: true,
          webpacker: Admin.webpacker
        )
    end

    config.app_middleware.use(
      Rack::Static,
      urls: ["/packs"], root: ROOT_PATH.join("/public")
    )
  end
end
