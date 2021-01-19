defmodule LiveViewStudio.Utilita do

  def convert_struct_with_string_to_atom(struct_with_key_string) do
    for {key, val} <- struct_with_key_string, into: %{}, do: {String.to_atom(key), val}
  end

  def convert_lista_atom_keys(lista) do
    Enum.map(lista, &convert_struct_with_string_to_atom/1)
  end
end
