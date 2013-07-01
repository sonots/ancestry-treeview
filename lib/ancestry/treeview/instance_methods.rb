module Ancestry
  module InstanceMethods
    def tree(params = {})
      return '' unless self
      subtree = (params[:to_depth].present? ? self.subtree(to_depth: params[:to_depth]) : self.subtree).order('path ASC')
      if params[:conditions].is_a?(Array) || params[:conditions].is_a?(Hash)
        subtree = subtree.where(params[:conditions])
      end
      html = '<div class="ancestry-treeview">'
      open_ul = 0
      prev_depth = self.depth - 1
      subtree.each do |node|
        curr_depth = node.depth
        diff = curr_depth - prev_depth
        if curr_depth > prev_depth
          html += '<ul><li style="list-style:none">' * (diff - 1).abs
          html += node.is_childless? ? '<ul><li class="leaf">' : '<ul><li>'
          open_ul += diff
        elsif curr_depth == prev_depth
          html += node.is_childless? ? '</li><li class="leaf">' : '</li><li>'
        elsif curr_depth < prev_depth
          html += '</li></ul>' * diff.abs
          html += node.is_childless? ? '</li><li class="leaf">' : '</li><li>'
          open_ul -= diff
        end
        prev_depth = curr_depth
        html += block_given? ? yield(node) : "<a href=#>#{node.id}</a>"
      end
      html += '</li></ul>' * open_ul.abs
      html += '</div>'
      html
    end
  end
end
