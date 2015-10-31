require 'test_helper'

class LogTest < ActiveSupport::TestCase
  test 'label auto creation' do
    log = Log.new title: '#tiTELING #hoBbit [smuRFing] Some title'

    assert_difference 'log.label_list.count', 3 do
      log.save
    end

    %w(titeling hobbit smurfing).each do |label_name|
      assert_includes log.label_list, label_name
    end
  end
end
