# Display para IPD de Elevadores

Rotina para exibição dos andares e status do elevador nos IPD's.

Pode exibir um ou dois caracteres, suportando letras de A-Z e números de 0-9.

As informações do andar atual e status do elevador são recebidas via porta serial.

### Demonstração

Exibição padrão ao inicializar a placa, aguardando comunicação serial.

![Aguardando](/images/ag.jpeg)

Animação subindo do térreo para o 1° andar.

![Térreo para 1](/images/1.gif)

Animação subindo do 1° para o 2° andar.

![1 para 2](/images/2.gif)

### Instalação

Clone o repositório, obtendo todos os arquivos gerados pelo projeto do mikroC, tanto o hexadecimal para gravação, quanto os arquivos `.c` e `.h`.

```sh
$ git clone https://github.com/marocama/IPD_Display_Elevador.git
```

