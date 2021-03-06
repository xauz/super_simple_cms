module SuperSimpleCMS::Helpers::NavigationHelper
  
  def super_simple_cms_links(css_class = nil)
    html = ""
    
    if @links && @links.length > 0
      if @links.first.group != SuperSimpleCms::Group.find(:first, :order=>'position')
        @links.each do |link|
          html << "<li class='#{css_class}'>#{link_to link.title, view_group_path(:page_group=>link.group.group_name, :perma_link=>link.perma_link)}</li>"
        end
      else
        @links.each do |link|
          html << "<li class='#{css_class}'>#{link_to link.title, view_page_path(link.perma_link)}</li>"
        end
      end
    end
    
    if @group_links && !@group_links.empty?
      @group_links.each do |group_link|
        html << "<li class='#{css_class}'>#{link_to group_link.group.group_name, view_group_path(:page_group=>group_link.group.group_name, :perma_link=>group_link.perma_link) if @links.first.group != group_link.group}</li>"
      end
    end

    return html
  end
end
