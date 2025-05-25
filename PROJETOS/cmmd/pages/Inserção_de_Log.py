import streamlit as st
import base64

# Estilização
st.markdown("""
    <style>
        .block-container {
            padding-top: 0;
            width: 60% !important;
            max-width: 60% !important;
            height: 40% !important;
            max-height: 40% !important;
        }
    </style>
""", unsafe_allow_html=True)

st.title("PÁGINA DE INSERÇÃO DE LOG")

with st.form("form_log"):
    nome_rotina = st.text_input("Nome da Rotina")
    frequencia = st.selectbox("Frequência de Execução", ["Diário", "Semanal", "Quinzenal", "Mensal"])
    time_start = st.text_input("Inicío da Execução da Rotina")
    time_end = st.text_input("Término da Execução da Rotina")
    resultado = st.text_input("Volume Analisado")
    analista = st.text_input("Analista Responsável")
    coordenador = st.text_input("Coordenador")
    gerente = st.text_input("Gerente")
    
    submitted = st.form_submit_button("Cadastrar")

# Submissão do formulário alimenta JSON e cria o arquivo Excel
# if submitted:



