module Web  
  class HomeController < Web::WebController
    def index
      render(layout: 'default')
    end

    def latest_orders
    end

    def latest_customers
      customers = Rails.cache.fetch('latest_customers', expires_in: 1.hour) do
        Customer.order('created_at desc').limit(5).map do |customer|
          {
            id: customer.id,
            uid: customer.uid,
            code: customer.code,
            name: customer.name
          }
        end
      end

      render(json: Oj.dump(customers, mode: :compat))
    end

    def latest_products
      products = Rails.cache.fetch('latest_products', expires_in: 1.hour) do
        Product.includes(:brand).order('created_at desc').limit(5).map do |product|
          {
            id: product.id,
            uid: product.uid,
            code: product.code,
            brand: (product.brand.nil? ? nil : product.brand.name),
            name: product.name
            # createdAt: product.created_at.strftime("%d/%m/%Y")
          }
        end
      end

      render(json: Oj.dump(products, mode: :compat))
    end
  end
end