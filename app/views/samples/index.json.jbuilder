json.array!(@samples) do |sample|
  json.extract! sample, :id, :lab_id, :lab_nr, :bp, :std, :delta_13_c, :delta_13_c_std, :prmat_id, :prmat_comment, :comment, :feature, :feature_type_id, :phase_id, :site_id, :approved, :right_id, :dating_method_id, :contact_e_mail, :creator_ip
  json.url sample_url(sample, format: :json)
end
