module ApplicationHelper
  def toggle_link_text(order, option)
    if order == option
      "Turn Off #{option.humanize}"
    else
      "Turn On #{option.humanize}"
    end
  end

  def toggle_params(option)
    order = params[:order] == option.to_s ? nil : option
    params.permit(:query, :order).merge(order: order)
  end
end
