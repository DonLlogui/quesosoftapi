const Conexion = require('../Conexion');

class UsuarioModel {
  constructor() {
    if (UsuarioModel.instance) {
      return UsuarioModel.instance;
    }

    this.db = Conexion;
    UsuarioModel.instance = this;
  }

  /**
   * Crea un nuevo usuario en la base de datos
   */
  async crear(usuario) {
    const {
      documento,
      nombres,
      telefono,
      correo,
      constrasena,
      fechacreacion = new Date().toISOString(),
      intentofallidos = 0
    } = usuario;

    const query = `
      INSERT INTO usuarios (documento, nombres, telefono, correo, constrasena, fechacreacion, intentofallidos)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
      RETURNING *;
    `;

    const values = [
      documento, nombres, telefono, correo, constrasena, fechacreacion, intentofallidos
    ];

    try {
      const result = await this.db.query(query, values);
      return result.rows[0];
    } catch (err) {
      console.error('❌ Error al crear usuario:', err.message);
      throw err;
    }
  }

  /**
   * Busca un usuario por su ID
   */
  async buscarPorId(idusuario) {
    const query = `SELECT * FROM usuarios WHERE idusuario = $1;`;

    try {
      const result = await this.db.query(query, [idusuario]);
      return result.rows[0] || null;
    } catch (err) {
      console.error('❌ Error al buscar usuario por ID:', err.message);
      throw err;
    }
  }

  /**
   * Busca un usuario por su correo
   */
  async buscarPorCorreo(correo) {
    const query = `SELECT * FROM usuarios WHERE correo = $1;`;

    try {
      const result = await this.db.query(query, [correo]);
      return result.rows[0] || null;
    } catch (err) {
      console.error('❌ Error al buscar usuario por correo:', err.message);
      throw err;
    }
  }

  /**
   * Lista todos los usuarios
   */
  async listarTodos() {
    const query = `SELECT * FROM usuarios ORDER BY idusuario ASC;`;

    try {
      const result = await this.db.query(query);
      return result.rows;
    } catch (err) {
      console.error('❌ Error al listar usuarios:', err.message);
      throw err;
    }
  }
}

// Exportamos la instancia única (Singleton)
module.exports = new UsuarioModel();
