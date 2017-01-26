class AllMerchantsSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    # sum = 0
    # object.inject { |sum, merchant| merchant.total_revenue.to_i += sum }
    (object / 100.0).to_s

    # revenues = []
    # object.each do |m|
    #   revenues << m.total_revenue
    # end
    # (revenues.inject(:+)/ 100.0).to_s
  end
end
