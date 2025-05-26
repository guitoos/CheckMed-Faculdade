
# Função para conectar ao banco de dados
def conectar():
    conexao = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="checkmed"
    )
    return conexao

# Função para cadastrar um novo paciente
def cadastrar_paciente():
    conexao = conectar()
    cursor = conexao.cursor()

    nome = input("Digite o nome do paciente: ")
    cpf = input("Digite o CPF: ")
    data_nasc = input("Digite a data de nascimento (AAAA-MM-DD): ")
    telefone = input("Digite o telefone: ")
    email = input("Digite o e-mail: ")

    comando = (
        "INSERT INTO tbl_pacientes (nome, cpf, data_nasc, telefone, email) "
        "VALUES ('" + nome + "', '" + cpf + "', '" + data_nasc + "', '" + telefone + "', '" + email + "')"
    )

    cursor.execute(comando)
    conexao.commit()

    print("Paciente cadastrado com sucesso!")

    cursor.close()
    conexao.close()

# Função para listar todos os pacientes
def listar_pacientes():
    conexao = conectar()
    cursor = conexao.cursor()

    comando = "SELECT id, nome, cpf, data_nasc, telefone FROM tbl_pacientes"
    cursor.execute(comando)
    pacientes = cursor.fetchall()

    if len(pacientes) == 0:
        print("Nenhum paciente cadastrado.")
    else:
        for paciente in pacientes:
            print("ID:", paciente[0])
            print("Nome:", paciente[1])
            print("CPF:", paciente[2])
            print("Data de Nascimento:", paciente[3])
            print("Telefone:", paciente[4])
            print("-------------------------")

    cursor.close()
    conexao.close()

# Função para buscar paciente pelo CPF
def buscar_paciente():
    conexao = conectar()
    cursor = conexao.cursor()

    cpf = input("Digite o CPF do paciente: ")
    comando = "SELECT * FROM tbl_pacientes WHERE cpf = '" + cpf + "'"

    cursor.execute(comando)
    paciente = cursor.fetchone()

    if paciente:
        print("\nPaciente encontrado:")
        print("ID:", paciente[0])
        print("Nome:", paciente[1])
        print("CPF:", paciente[2])
        print("Data de Nascimento:", paciente[3])
        print("Telefone:", paciente[4])
        print("E-mail:", paciente[5])
    else:
        print("Paciente não encontrado!")

    cursor.close()
    conexao.close()

# Função para confirmar presença na consulta
def confirmar_presenca():
    conexao = conectar()
    cursor = conexao.cursor()

    cpf = input("Digite o CPF do paciente: ")
    comando_buscar = "SELECT id FROM tbl_pacientes WHERE cpf = '" + cpf + "'"
    cursor.execute(comando_buscar)
    paciente = cursor.fetchone()

    if paciente:
        paciente_id = paciente[0]
        comando_atualizar = "UPDATE tbl_consultas SET status_id = 2 WHERE paciente_id = " + str(paciente_id)
        cursor.execute(comando_atualizar)
        conexao.commit()
        print("Presença confirmada com sucesso!")
    else:
        print("Paciente não encontrado!")

    cursor.close()
    conexao.close()

# Função para cadastrar um prontuário
def cadastrar_prontuario():
    conexao = conectar()
    cursor = conexao.cursor()

    # Mostrar lista de pacientes para escolha
    comando_pacientes = "SELECT id, nome FROM tbl_pacientes"
    cursor.execute(comando_pacientes)
    pacientes = cursor.fetchall()

    print("\nLista de Pacientes:")
    for paciente in pacientes:
        print(f"{paciente[0]} - {paciente[1]}")
    
    paciente_id = input("Digite o ID do paciente: ")
    
    # Mostrar lista de médicos para escolha
    comando_medicos = "SELECT id, nome, especialidade FROM tbl_medicos"
    cursor.execute(comando_medicos)
    medicos = cursor.fetchall()

    print("\nLista de Médicos:")
    for medico in medicos:
        print(f"{medico[0]} - {medico[1]} ({medico[2]})")
    
    medico_id = input("Digite o ID do médico: ")
    
    observacoes = input("Digite as observações: ")
    diagnostico = input("Digite o diagnóstico: ")
    prescricao = input("Digite a prescrição: ")

    comando = (
        "INSERT INTO tbl_prontuarios (paciente_id, data_registro, medico_id, observacoes, diagnostico, prescricao) "
        "VALUES (" + paciente_id + ", NOW(), " + medico_id + ", '" + observacoes + "', '" + diagnostico + "', '" + prescricao + "')"
    )

    cursor.execute(comando)
    conexao.commit()

    print("Prontuário cadastrado com sucesso!")

    cursor.close()
    conexao.close()

# Função para listar prontuários de um paciente
def listar_prontuarios():
    conexao = conectar()
    cursor = conexao.cursor()

    cpf = input("Digite o CPF do paciente: ")
    comando_buscar = "SELECT id FROM tbl_pacientes WHERE cpf = '" + cpf + "'"
    cursor.execute(comando_buscar)
    paciente = cursor.fetchone()

    if paciente:
        paciente_id = paciente[0]
        
        # Buscar prontuários
        comando = (
            "SELECT p.data_registro, m.nome, p.diagnostico, p.prescricao "
            "FROM tbl_prontuarios p "
            "INNER JOIN tbl_medicos m ON p.medico_id = m.id "
            "WHERE p.paciente_id = " + str(paciente_id)
        )
        
        cursor.execute(comando)
        prontuarios = cursor.fetchall()
        
        if len(prontuarios) == 0:
            print("Nenhum prontuário encontrado para este paciente.")
        else:
            print("\nProntuários do paciente:")
            for prontuario in prontuarios:
                print("Data:", prontuario[0])
                print("Médico:", prontuario[1])
                print("Diagnóstico:", prontuario[2])
                print("Prescrição:", prontuario[3])
                print("-------------------------")
    else:
        print("Paciente não encontrado!")

    cursor.close()
    conexao.close()

# Função para cadastrar um médico
def cadastrar_medico():
    conexao = conectar()
    cursor = conexao.cursor()

    nome = input("Digite o nome do médico: ")
    especialidade = input("Digite a especialidade: ")
    cpf = input("Digite o CPF: ")

    comando = (
        "INSERT INTO tbl_medicos (nome, especialidade, cpf) "
        "VALUES ('" + nome + "', '" + especialidade + "', '" + cpf + "')"
    )

    cursor.execute(comando)
    conexao.commit()

    print("Médico cadastrado com sucesso!")

    cursor.close()
    conexao.close()

# Função para listar médicos
def listar_medicos():
    conexao = conectar()
    cursor = conexao.cursor()

    comando = "SELECT id, nome, especialidade, cpf FROM tbl_medicos"
    cursor.execute(comando)
    medicos = cursor.fetchall()

    if len(medicos) == 0:
        print("Nenhum médico cadastrado.")
    else:
        for medico in medicos:
            print("ID:", medico[0])
            print("Nome:", medico[1])
            print("Especialidade:", medico[2])
            print("CPF:", medico[3])
            print("-------------------------")

    cursor.close()
    conexao.close()

# Função para agendar consulta
def agendar_consulta():
    conexao = conectar()
    cursor = conexao.cursor()

    # Mostrar lista de pacientes
    comando_pacientes = "SELECT id, nome FROM tbl_pacientes"
    cursor.execute(comando_pacientes)
    pacientes = cursor.fetchall()

    print("\nLista de Pacientes:")
    for paciente in pacientes:
        print(f"{paciente[0]} - {paciente[1]}")
    
    paciente_id = input("Digite o ID do paciente: ")
    
    # Mostrar lista de médicos
    comando_medicos = "SELECT id, nome, especialidade FROM tbl_medicos"
    cursor.execute(comando_medicos)
    medicos = cursor.fetchall()

    print("\nLista de Médicos:")
    for medico in medicos:
        print(f"{medico[0]} - {medico[1]} ({medico[2]})")
    
    medico_id = input("Digite o ID do médico: ")
    
    # Data e hora
    data_hora = input("Digite a data e hora (AAAA-MM-DD HH:MM:SS): ")
    
    # Status inicial (1 = Aguardando confirmação)
    status_id = "1"

    comando = (
        "INSERT INTO tbl_consultas (paciente_id, medico_id, data_hora, status_id) "
        "VALUES (" + paciente_id + ", " + medico_id + ", '" + data_hora + "', " + status_id + ")"
    )

    cursor.execute(comando)
    conexao.commit()

    print("Consulta agendada com sucesso!")

    cursor.close()
    conexao.close()

# Função para listar consultas
def listar_consultas():
    conexao = conectar()
    cursor = conexao.cursor()

    comando = (
        "SELECT c.id, p.nome, m.nome, c.data_hora, s.descricao "
        "FROM tbl_consultas c "
        "INNER JOIN tbl_pacientes p ON c.paciente_id = p.id "
        "INNER JOIN tbl_medicos m ON c.medico_id = m.id "
        "INNER JOIN tbl_status_consultas s ON c.status_id = s.id "
        "ORDER BY c.data_hora"
    )
    
    cursor.execute(comando)
    consultas = cursor.fetchall()

    if len(consultas) == 0:
        print("Nenhuma consulta agendada.")
    else:
        for consulta in consultas:
            print("ID:", consulta[0])
            print("Paciente:", consulta[1])
            print("Médico:", consulta[2])
            print("Data/Hora:", consulta[3])
            print("Status:", consulta[4])
            print("-------------------------")

    cursor.close()
    conexao.close()

# Função para exibir o menu principal
def menu():
    while True:
        print("\n=== Sistema CheckMed ===")
        print("1. Cadastrar Paciente")
        print("2. Listar Pacientes")
        print("3. Buscar Paciente")
        print("4. Confirmar Presença")
        print("5. Cadastrar Prontuário")
        print("6. Listar Prontuários")
        print("7. Cadastrar Médico")
        print("8. Listar Médicos")
        print("9. Agendar Consulta")
        print("10. Listar Consultas")
        print("11. Sair")

        opcao = input("Digite sua opção: ")

        if opcao == "1":
            cadastrar_paciente()
        elif opcao == "2":
            listar_pacientes()
        elif opcao == "3":
            buscar_paciente()
        elif opcao == "4":
            confirmar_presenca()
        elif opcao == "5":
            cadastrar_prontuario()
        elif opcao == "6":
            listar_prontuarios()
        elif opcao == "7":
            cadastrar_medico()
        elif opcao == "8":
            listar_medicos()
        elif opcao == "9":
            agendar_consulta()
        elif opcao == "10":
            listar_consultas()
        elif opcao == "11":
            print("Encerrando o sistema... Até logo!")
            break
        else:
            print("Opção inválida! Por favor, tente novamente.")

# Executar o programa
menu()