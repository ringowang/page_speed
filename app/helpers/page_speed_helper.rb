module PageSpeedHelper
  # 处理插值
  def trans_link(content)
    tem_hash = {}
    if content['args']
      content['args'].each do |arg|
        tem_hash.merge! arg['key'] => arg['value']
      end
    end

    tem_hash.each do |k, v|
      content['format'].gsub!('{{' + k + '}}', v)
    end
    if content['format'] =~ /(.*){{BEGIN_LINK}}(.*){{END_LINK}}(.*)/
      content['format'] = $1 + link_to($2, tem_hash["LINK"]) + $3
    end
    content['format'].html_safe
  end
end
