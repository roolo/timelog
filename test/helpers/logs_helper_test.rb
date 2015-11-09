require 'test_helper'

class LogsHelperTest < ActionView::TestCase
  include LogsHelper

  test '#replace_labels' do
    input_text = '#tiTELING #hoBbit [smuRFing] Some title'

    result_text = replace_labels input_text, 'hobbit'

    expected_result = <<-HTML
<a href="/?label_name=titeling">
  <span class="label label-default">
    titeling
  </span>
</a>
 <a href="/?label_name=hobbit">
  <span class="label label-primary">
    hobbit
  </span>
</a>
 <a href="/?label_name=smurfing">
  <span class="label label-default">
    smurfing
  </span>
</a>
 Some title
HTML

    assert_dom_equal expected_result.strip, result_text.strip
  end
end
