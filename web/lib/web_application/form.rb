module WebApplication
  class Form < ApplicationBase
    include Hanami::Helpers

    get '/' do
      @form = form_for 'filter', '/calculate/', method: :post do
        fieldset class: 'form-group' do
          legend 'КФД аппроксимация'

          fields_for :kfd_points do
            table class: 'table' do
              tr do
                th ''
                th 'Диаметр, мкм'
                th 'КФД'
              end

              8.times do |n|
                tr do
                  td n + 1
                  fields_for n do
                    td { text_field :x, class: 'form-control input-sm' }
                    td { text_field :y, class: 'form-control input-sm' }
                  end
                end
              end
            end
          end

          br
          br

          div class: 'form-inline' do
            label 'Точка перелома КФД функции, мкм', for: :kfd_breaking_point
            text_field :kfd_breaking_point, value: 0.3, class: 'form-control input-sm'
          end
        end

        br
        fieldset do
          legend 'Ст. сопротивление,  мм в.ст.'
          fields_for :resistences do
            div class: 'form-inline' do
              label 'Фильтр 1', for: :filter_1
              text_field :filter_1, class: 'form-control input-sm'
            end
            div class: 'form-inline' do
              label 'Фильтр 2', for: :filter_2
              text_field :filter_2, class: 'form-control input-sm'
            end
            div class: 'form-inline' do
              label 'Фильтр 3', for: :filter_3
              text_field :filter_3, class: 'form-control input-sm'
            end
          end
        end
        br
        fieldset do
          legend 'Отношение активностей на фильтрах'
          fields_for :consumptions do
            div class: 'form-inline' do
              label 'N2 / N1', for: :n2n1
              text_field :n2n1, class: 'form-control input-sm'
            end
            div class: 'form-inline' do
              label 'N3 / N2', for: :n3n2
              text_field :n3n2, class: 'form-control input-sm'
            end
          end
        end
        br
        fieldset do
          legend 'Точность расчета'
          fields_for :accuracy do
            div class: 'form-inline' do
              label 'Разность квадратов'
              text_field :epsilon, value: 0.0001, class: 'form-control input-sm'
            end
            div class: 'form-inline' do
              label 'Итерации'
              text_field :iterations, value: 5, class: 'form-control input-sm'
            end
          end
        end
        br
        fieldset do
          legend 'Начальные условия расчета'
          fields_for :start_point do
            label 'АМАД', for: :p1
            text_field :p1, value: 1, class: 'form-control'
            label 'СГО', for: :p2
            text_field :p2, value: 1, class: 'form-control'
          end
        end

        br

        submit 'Рассчитать', class: 'btn btn-primary'
      end

      erb :form
    end
  end
end
