module EmploymentApplicationFormsHelper
  def selected_company_id(client_intake_form, company_id)
    if client_intake_form.persisted?
      client_intake_form.company_id
    else
      company_id
    end
  end
end
