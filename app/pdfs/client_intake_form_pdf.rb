class ClientIntakeFormPdf < Prawn::Document
  def initialize(client_intake_form)
    super()
    @client_intake_form = client_intake_form
    generate_pdf
  end

  def generate_pdf
    text "Client Intake Form", size: 16, style: :bold, align: :center
    move_down 20

    @client_intake_form.attributes.each do |attribute|
      text "#{attribute[0]}: #{attribute[1]}"
    end
  end
end
