module LogsHelper
  # @param [String] input_text Text containing some tags
  # @param [String] filter_label_name Name of label by which is currently filtered list of logs
  #
  # @return [String] text with hyperlinks instead of plain labels
  def replace_labels input_text, filter_label_name
    found = input_text.match(Log::LABEL_REGEXP)

    if found && found[:label]
      html_label = render(
        partial: 'logs/label_name_filter_link',
        locals: {
          label: found[:label].downcase,
          filter_label_name: filter_label_name
        }
      )

      output_text = input_text.gsub(
        found.to_s,
        html_label
      )

      replace_labels output_text,
                     filter_label_name
    else
      input_text
    end
  end
end
