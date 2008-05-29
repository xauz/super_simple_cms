module SuperSimpleCMS::Helpers::NavigationHelper
  
  def super_simple_cms_links
    html = ""
        if @group_links && !@group_links.empty?
          @group_links.each do |group_link|
            html << "<li>#{link_to group_link.group.group_name, view_group_path(:page_group=>group_link.group.group_name, :perma_link=>group_link.perma_link) if @links.first.group != group_link.group}</li>"
          end
        end
    
    if @links && @links.length > 0
      if @links.first.group != SuperSimpleCms::Group.find_by_group_name("Home")
        @links.each do |link|
          html << "<li>#{link_to link.title.downcase, view_group_path(:page_group=>link.group.group_name, :perma_link=>link.perma_link)}</li>"
        end
      else
        @links.each do |link|
          html << "<li>#{link_to link.title.downcase, view_page_path(link.perma_link)}</li>"
        end
      end
    end

    return html
  end
end
